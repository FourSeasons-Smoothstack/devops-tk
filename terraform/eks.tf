resource "aws_iam_role" "eks_cluster" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_eks_cluster" "eks-tk" {
  name="aline-tk"
  role_arn = aws_iam_role.eks_cluster.arn
  version = "1.22"
  
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true
    subnet_ids = [
        aws_subnet.main-public-subnet-1b.id,
        aws_subnet.main-public-subnet-1c.id,
        aws_subnet.main-private-subnet-1b.id,
        aws_subnet.main-private-subnet-1c.id,
    ]
  }
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}


resource "aws_eks_node_group" "nodes_general" {

    cluster_name = var.eks_cluster_name
    node_group_name = var.node_group_name
    node_role_arn = aws_iam_role.nodes_general.arn
    subnet_ids = var.subnet_ids


    scaling_config {
      desired_size = 1
      max_size = 1
      min_size = 1
    }
  ami_type = "AL2_x86_64"
  #AL2_x86_64"

  capacity_type = "ON_DEMAND"

  disk_size = 20

  force_update_version = false

   instance_types = ["t2.micro"]

   version = "1.24"

   depends_on = [ 
     
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,

    ]
      tags =  var.tags
}

resource "aws_iam_role" "nodes_general" {
  # The name of the role
  name = var.node_group_name

  # The policy that grants an entity permission to assume the role.
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }, 
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}



resource "aws_iam_role_policy_attachment" "amazon_eks_worker_node_policy_general" {
  # The ARN of the policy you want to apply.
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  # The role the policy should be applied to
  role = aws_iam_role.nodes_general.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy_general" {
  # The ARN of the policy you want to apply.
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

  # The role the policy should be applied to
  role = aws_iam_role.nodes_general.name
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  # The ARN of the policy you want to apply.
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

  # The role the policy should be applied to
  role = aws_iam_role.nodes_general.name
}

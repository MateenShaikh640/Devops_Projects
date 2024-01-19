aws_eks_cluster_config = {
    "demo-cluster" ={

        eks_cluster_name = "demo-cluster1"
        eks_subnet_ids = ["subnet-015184fcb4bf4faef","subnet-0c0cb09e9df5e9cc8","subnet-0c1183ba717a5a723"]

        tags = {
            "Name" = "demo-cluster"
        }
    }
}


eks_node_group_config = {

    "node1" = {

        eks_cluster_name =  "demo-cluster"
        node_group_name = "mynode"
        nodes_iam_role = "eks-node-group-general1"
        node_subnet_ids = ["subnet-015184fcb4bf4faef","subnet-0c0cb09e9df5e9cc8","subnet-0c1183ba717a5a723"]


        tags ={
            "Name" = "node1"
        }
    }

}
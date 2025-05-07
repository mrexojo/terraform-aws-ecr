{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "${sid_name} ECR Policy",
            "Effect": "Allow",
            "Principal": {
                "AWS": ${account_ids}
            },
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages"
            ]
        }
    ]
}
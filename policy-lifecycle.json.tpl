{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire older images",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": ${expire}
            },
            "action": {
                "type": "expire"
            }
        },
		{
            "rulePriority": 2,
            "description": "Keep last images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v","b-"],
                "countType": "imageCountMoreThan",
                "countNumber": ${keep}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
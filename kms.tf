resource "aws_kms_key" "jenkins-kms" {
    description = "Encrypt data at rest in EFS"
    policy = "{\"Statement\":{\"Action\":\"Kms:*\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Ressource\":\"*\",\"Sid\":\"Enable IAM user Permissions\"},\"version\":\"2012-10-17\"}"
}

resource "aws_kms_key" "git-kms" {
    description = "Encrypt data at rest in EFS"
    policy = "{\"Statement\":{\"Action\":\"Kms:*\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Ressource\":\"*\",\"Sid\":\"Enable IAM user Permissions\"},\"version\":\"2012-10-17\"}"
}
resource "aws_elasticache_subnet_group" "gitlab_redis" {
  name       = "gitlab-redis-subnet-group"
  subnet_ids = ["${aws_subnet.private_subnet_1.id}", "${aws_subnet.private_subnet_2.id}"]
}

resource "aws_elasticache_replication_group" "gitlab_redis" {
  replication_group_id = "gitlab"

  description                = "Redis cluster powering GitLab"
  engine                     = "redis"
  node_type                  = "cache.m4.large"
  num_cache_clusters         = 2
  port                       = 6379
  availability_zones         = ["us-east-2a", "us-east-2b"]
  automatic_failover_enabled = true
  security_group_ids         = ["${aws_elasticache_subnet_group.gitlab_redis.name}"]
}

output "gitlab_redis_endpoint_address" {
  value = aws_elasticache_replication_group.gitlab_redis.primary_endpoint_address

}
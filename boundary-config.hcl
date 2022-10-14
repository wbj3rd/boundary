
disable_mlock = true

controller {
	name = "kubernetes-controller"
	description = "A controller for a kubernetes demo!"
	database {
			url = "postgresql://postgres:password@postgres-postgresql:5432/postgres?sslmode=disable"
	}
	public_cluster_addr = "localhost"
}

worker {
	name = "kubernetes-worker"
	description = "A worker for a kubernetes demo"
	address = "localhost"
  controllers = ["localhost"]
	public_addr = "localhost"
}

listener "tcp" {
	address = "0.0.0.0"
	purpose = "api"
	tls_disable = true
}

listener "tcp" {
	address = "0.0.0.0"
	purpose = "cluster"
	tls_disable = true
}

listener "tcp" {
	address = "0.0.0.0"
	purpose = "proxy"
	tls_disable = true
}

kms "aead" {
	purpose = "root"
	aead_type = "aes-gcm"
	key = "sP1fnF5Xz85RrXyELHFeZg9Ad2qt4Z4bgNHVGtD6ung="
	key_id = "global_root"
}

kms "aead" {
	purpose = "worker-auth"
	aead_type = "aes-gcm"
	key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
	key_id = "global_worker-auth"
}

kms "aead" {
	purpose = "recovery"
	aead_type = "aes-gcm"
	key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
	key_id = "global_recovery"
}
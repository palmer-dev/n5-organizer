# Development Environment
.PHONY: dev-build
dev-build: ## Build the development docker containers.
	docker compose -f docker/dev/docker-compose.yml build

.PHONY: dev-up
dev-up: ## Start the development docker containers.
	docker compose -f docker/dev/docker-compose.yml up -d

.PHONY: dev-down
dev-down: ## Stop the development docker containers.
	docker compose -f docker/dev/docker-compose.yml down

.PHONY: dev-logs
dev-logs: ## Show logs for development containers.
	docker compose -f docker/dev/docker-compose.yml logs -f

.PHONY: dev-restart
dev-restart: ## Restart the development docker containers.
	docker compose -f docker/dev/docker-compose.yml restart

# Production Environment
.PHONY: prod-build
prod-build: ## Build the production docker containers.
	docker compose -f docker/prod/docker-compose.yml build

.PHONY: prod-up
prod-up: ## Start the production docker containers.
	docker compose -f docker/prod/docker-compose.yml up -d

.PHONY: prod-down
prod-down: ## Stop the production docker containers.
	docker compose -f docker/prod/docker-compose.yml down

.PHONY: prod-logs
prod-logs: ## Show logs for production containers.
	docker compose -f docker/prod/docker-compose.yml logs -f

.PHONY: prod-restart
prod-restart: ## Restart the production docker containers.
	docker compose -f docker/prod/docker-compose.yml restart

# Utility Commands
.PHONY: clean
clean: ## Remove all stopped containers and unused volumes.
	docker compose -f docker/dev/docker-compose.yml down -v
	docker compose -f docker/prod/docker-compose.yml down -v

.PHONY: help
help: ## Show this help message.
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
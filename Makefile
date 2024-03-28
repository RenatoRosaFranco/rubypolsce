# Define variables
APP_NAME=rubypolsce_web_1
BUNDLE=bundle exec
DOCKER_COMPOSE=docker-compose
DOCKER=docker
RAILS=rails
RAILS_ENV=development

# Install dependencies
install:
	gem install bundler
	$(BUNDLE) lock --add-platform x86_64-linux ruby x86-mingw32 x86-mswin32 x64-mingw32 java
	$(BUNDLE) install

# Build the Docker images
build:
	$(DOCKER_COMPOSE) build

# Build the docker images without using cache
build-nocache:
	$(DOCKER_COMPOSE) build --no-cache

# Start the docker containers
up:
	$(DOCKER_COMPOSE) up

# Open a Rails console
console:
	$(DOCKER) exec -it $(APP_NAME) $(BUNDLE) $(RAILS) c

# Attach to the Docker container for bash
attach:
	$(DOCKER) exec -it $(APP_NAME) bash

# Generate the Entity-Relationship Diagram (ERD)
generate-erd:
	$(DOCKER) exec $(APP_NAME) erd .

# Start the rails server
start:
	$(DOCKER) exec -it $(APP_NAME) bash -c "rails server -e $(RAILS_ENV) -p 3000"

# Clean up the project directory
clean:
	sudo chown -R ${USER} .
	rm -rf ./coverage ./tmp/* ./log/*

# Stop and remove Docker containers
down:
	$(DOCKER_COMPOSE) down

# Renew the database (custom command, ensure it's defined correcly)
dbrenew:
	$(BUNDLE) $(RAILS) db:renew

# Reset the database
dbreset:
	$(BUNDLE) $(RAILS) db:drop db:create db:migrate db:seed db:test:prepare

# Create a .env file from sample
create-env-file:
	cp .env.sample .env

# Lint SCSS files
scss-lint:
	$(BUNDLE) scss-lint app/assets/stylesheets/

# Run fasterer
fasterer:
	$(BUNDLE) fasterer .

# Check for best practices
best-practices:
	$(BUNDLE) rails_best_practices .

# Run Rubocop
rubocop:
	$(BUNDLE) rubocop .

# Run Rubycritic
rubycritic:
	$(BUNDLE) rubycritic .

# Run Flog
flog:
	$(BUNDLE) flog .

# Start application with Foreman
foreman:
	$(BUNDLE) foreman .

# Run tests
test:
	$(BUNDLE) rspec spec

# Setup overcommit
overcommit:
	$(BUNDLE) overcommit -i
	$(BUNDLE) overcommit --sign pre-commit
	$(BUNDLE) overcommit -r

# Renew gems
gems-renew:
	gem uninstall -aIx
	sudo apt autoremove
	make install

# Define how to copy a file (usage: $(call cp-file, source, destination))
define cp-file
	cp -vf config/$(1) $(2)/;
endef
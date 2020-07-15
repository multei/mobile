# ==================================================================================================
# Setup
# ==================================================================================================

setup: install_precommit install_prepush ## all setup for project first local execution goes here

install: ## install flutter dependencies
	flutter pub get

install_precommit: ## install precommit hook
	mkdir -p .git/hooks
	cp scripts/pre-commit.sh .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit

install_prepush: ## install prepush hook
	mkdir -p .git/hooks
	cp scripts/pre-push.sh .git/hooks/pre-push
	chmod +x .git/hooks/pre-push

# ==================================================================================================
# Helpers
# ==================================================================================================

format:
	flutter format

# ==================================================================================================
# Tests
# ==================================================================================================

lint: 
	flutter analyze

unit_test:
	flutter test

ui_test:
	open -a Simulator
	flutter drive --target=test_driver/app.dart

# ==================================================================================================
# Build
# ==================================================================================================

assemble_debug:
	flutter build apk --debug --split-per-abi

deploy-to-internal:
	bash scripts/release_internal.sh
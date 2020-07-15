# ==================================================================================================
# Setup
# ==================================================================================================

setup: install_precommit install_prepush install_commitmsg ## all setup for project first local execution goes here

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

install_commitmsg: ## install prepush hook
	mkdir -p .git/hooks
	cp scripts/commit-msg.sh .git/hooks/commit-msg
	chmod +x .git/hooks/commit-msg

# ==================================================================================================
# Helpers
# ==================================================================================================

format:
	flutter format

list_simulators:
	xcrun instruments -s

# ==================================================================================================
# Tests
# ==================================================================================================

lint: 
	flutter analyze

unit_test:
	flutter test --coverage

ui_test:
	flutter drive --target=test_driver/app.dart

# ==================================================================================================
# Build
# ==================================================================================================

build_android:
	flutter build apk --debug --split-per-abi

build_ios:
	flutter build ios --release --no-codesign

deploy-to-internal:
	bash scripts/release_internal.sh

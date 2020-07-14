ui_test:
	open -a Simulator
	flutter drive --target=test_driver/app.dart

install_precommit:
	mkdir -p .git/hooks
	cp scripts/pre-commit.sh .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit

install_prepush:
	mkdir -p .git/hooks
	cp scripts/pre-push.sh .git/hooks/pre-push
	chmod +x .git/hooks/pre-push
BASE_HREF = '/hrithik-website/'
GITHUB_REPO = 'https://github.com/HrithikReddy2000/hrithik-website.git'
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')


deploy-web:
	@echo "Cleaning up old build files..."
	flutter clean
	
	@echo "Getting the packages..."
	flutter pub get

	@echo "Building the Flutter web application..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Deploying to GitHub Pages..."
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deployed version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin main

	@echo "Deployment complete! Visit $(GITHUB_REPO) to see your changes."
	@echo "Back to the root directory..."
	cd ../..
    
.PHONY: deploy-web
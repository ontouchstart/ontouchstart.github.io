build:	output/code_review_medium.md output/code_review.md
	../.cargo/bin/mdbook clean
	../.cargo/bin/mdbook build
	
serve:
	../.cargo/bin/mdbook serve

test:
	../.cargo/bin/mdbook test

output/code_review_medium.md: python/code_review_medium.py
	uv run python/code_review_medium.py > output/code_review_medium.md	

output/code_review.md: python/code_review.py
	uv run python/code_review.py > output/code_review.md

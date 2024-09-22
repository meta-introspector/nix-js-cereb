
dev:
	bun src/main.ts

build:
	bun build src/main.ts --compile --outfile dist/cereb

debug:
	bun --inspect src/main.ts

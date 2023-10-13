VERSION=v0.0.1
TITLE=Primeira Versao

create-release: 
	gh release create $(VERSION) -t "$(VERSION) - $(TITLE)" --generate-notes

recreate-release: 
	gh release delete $(VERSION) --cleanup-tag -y; \
	gh release create $(VERSION) -t "$(VERSION) - $(TITLE)" --generate-notes

delete-release: 
	gh release delete $(VERSION) --cleanup-tag -y

last-release:
	gh release list --limit 1

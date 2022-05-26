PRODUCT_NAME := alerm
.DEFAULT_GOAL := help

MINT_LIB_PATH := "./DevTool/Mint/lib"
MINT_LINK_PATH := "./DevTool/Mint/bin"

.PHONY: bootstrap
bootstrap: ## 必要なツールをセットアップします。プロジェクトを最初に始めるときに実行してください。
	@make install-brew
	@make bootstrap-mint

.PHONY: open
open: ## xcworkspaceをオープンします。
	open ./${PRODUCT_NAME}.xcodeproj

.PHONY: clear-cache
clear-cache: ## ビルド時に生成された中間ファイルを削除します。
	rm -rf ${TMPDIR}/TemporaryItems/*carthage*
	rm -rf ${HOME}/Library/Developer/Xcode/DerivedData/*

.PHONY: bootstrap-mint
bootstrap-mint: ## Mint で管理するツールを導入します。
	mkdir -p ${MINT_LIB_PATH}
	mkdir -p ${MINT_LINK_PATH}
	MINT_PATH=${MINT_LIB_PATH} MINT_LINK_PATH=${MINT_LINK_PATH} mint bootstrap --link

.PHONY: install-brew
install-brew: ## brew で管理するツールを導入します。
	brew list mint &>/dev/null || brew install mint
	brew link --force mint

.PHONY: exec-xcodegen
exec-xcodegen: ## xcodegen　を使って xcodeproj ファイルを作成します
	$(eval CMD := "${MINT_LINK_PATH}/xcodegen")
	@$(CMD) generate

.PHONY: exec-swiftformat
exec-swiftformat: ## swiftformat を実行します。
	$(eval SWIFT_VERSION := $(shell swift --version | tr ' ' '\n' | head -n 4 | tail -n 1))
	$(eval CMD := "${MINT_LINK_PATH}/swiftformat")
	@$(CMD) ${PRODUCT_NAME} --swiftversion $(SWIFT_VERSION)

.PHONY: exec-license-plist
exec-license-plist: ## 利用しているオープンソースライブラリのライセンスを作成します。
	$(eval CMD := "${MINT_LINK_PATH}/license-plist")
	@$(CMD) --output-path "Application/Settings.bundle" --github-token "${GITHUB_API_TOKEN}"

.PHONY: help
help: ## Display this help screen.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


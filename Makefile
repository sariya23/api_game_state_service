gen_game_state:
	mkdir -p gen/game_state && \
	protoc -I ./proto proto/game_state/game_state.proto \
		-I protoc-gen-validate/ \
		--go_out ./gen \
		--go_opt paths=source_relative \
		--go-grpc_out ./gen \
		--go-grpc_opt paths=source_relative \
		--grpc-gateway_out ./gen \
		--grpc-gateway_opt paths=source_relative \
		--openapiv2_out ./swagger \
		--validate_out="lang=go,paths=source_relative:./gen"

gen_common:
	mkdir -p gen/common && \
	protoc -I ./proto proto/common/enums.proto \
		--go_out ./gen \
		--go_opt paths=source_relative \
		--go-grpc_out ./gen \
		--go-grpc_opt paths=source_relative \
		--grpc-gateway_out ./gen \
		--grpc-gateway_opt paths=source_relative \
		--openapiv2_out ./swagger

gen_debug:
	mkdir -p gen/debug && \
	protoc -I ./proto proto/debug/debug.proto \
		--go_out ./gen \
		--go_opt paths=source_relative \
		--go-grpc_out ./gen \
		--go-grpc_opt paths=source_relative \
		--grpc-gateway_out ./gen \
		--grpc-gateway_opt paths=source_relative \
		--openapiv2_out ./swagger

clean:
	rm -rf gen/*
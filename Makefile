gen_game_state:
	mkdir -p gen/game_state && \
	protoc -I ./proto proto/game_state/game_state.proto \
		--go_out ./gen \
		--go_opt paths=source_relative \
		--go-grpc_out ./gen \
		--go-grpc_opt paths=source_relative \
		--grpc-gateway_out ./gen \
		--grpc-gateway_opt paths=source_relative \
		--openapiv2_out ./swagger

clean:
	rm -rf gen/*
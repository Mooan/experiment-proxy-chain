TEST_URL := google.com

.PHONY:
start:
	docker compose up -d

.PHONY:
stop:
	docker compose down

.PHONY:
test_no_proxy:
	curl -vl ${TEST_URL}

.PHONY:
test_proxy_a:
	export http_proxy=http://abc:123@localhost:3128; curl -vl ${TEST_URL}

.PHONY:
test_proxy_b:
	export http_proxy=http://localhost:8080; curl -vl ${TEST_URL}
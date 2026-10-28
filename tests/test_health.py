from fastapi.testclient import TestClient

from flat_matcher.main import app


def test_health_queries_postgres() -> None:
    with TestClient(app) as client:
        response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}

import os
from collections.abc import Iterator

from sqlmodel import Session, create_engine

DATABASE_URL = os.environ.get(
    "DATABASE_URL",
    "postgresql+psycopg://flat_matcher:flat_matcher@localhost:5432/flat_matcher",
)

engine = create_engine(DATABASE_URL)


def get_session() -> Iterator[Session]:
    with Session(engine) as session:
        yield session

from typing import Annotated

from fastapi import Depends, FastAPI
from sqlalchemy import text
from sqlmodel import Session

from flat_matcher.db import get_session

app = FastAPI()

SessionDep = Annotated[Session, Depends(get_session)]


@app.get("/health")
def health(session: SessionDep) -> dict[str, str]:
    session.connection().execute(text("SELECT 1")).one()
    return {"status": "ok"}


from fastapi import FastAPI

app = FastAPI()

@app.get("/posts")
def read_posts():
    return {
        "title":"post api",
        "articles": [
            {"num": 77, "title": "감격", "writer": "수강생B"},
            {"num": 78, "title": "질문", "writer": "주니어"}
        ]
    }
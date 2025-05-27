from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello, Oleg!"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

@app.get("/mars")
def hello_mars():
    return { "message": "Hello Mars!! " }

@app.get("/pluto")
def hello_pluto():
    return{ "message": "Hello Pluto" }

@app.get("/turja")
def hello_pluto():
    return{ "message": "Hello Turja!!!!!" }

@app.get("/health")
def health_check():
    return {"status": "ok good! Test 1"}

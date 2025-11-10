from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Welcome to FastAPI!"}

@app.get("/hello/{name}")
def greet_user(name: str):
    return {"message": f"Hello, {name}!"}

@app.post("/add")
def add_numbers(a: int, b: int):
    return {"sum": a + b}

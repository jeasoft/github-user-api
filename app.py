from fastapi import FastAPI
import httpx

app = FastAPI()

github_url = "https://api.github.com/users/{}"

@app.get("/")
def read_root():
    return {"Hello": "World"}

def github_response(github_user):
    response = None
    if github_user is None:
        response = {"message": "The user can't be blank, please, provide a valid user"}
    else: 
        user_response = httpx.get(github_url.format(github_user))
        if user_response.status_code == 404:
            response = {"message": "User not Found, Please try with a valid user"}
        else:
            response = user_response.json()
        return response

@app.get("/user/{github_user}")
def get_github_user(github_user: str):
    user = github_response(github_user)
    return user
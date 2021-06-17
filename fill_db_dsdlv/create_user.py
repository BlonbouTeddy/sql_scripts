from user import User

def create_user():
    u = User(
        id = 0,
        enabled = 1,
        last_login = None,
        password = "admin",
        platform_id = "1",
        roles = "ADMIN",
        username = "admin"
    )

    from main import db

    db.session.add(u)
    db.session.commit()

create_user()
from faker import Faker

fake = Faker()

def gerar_nome():
    return fake.name()

def gerar_email():
    return fake.email()
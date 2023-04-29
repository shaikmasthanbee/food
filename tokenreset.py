from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
def utoken(name,seconds):
    s=Serializer('67@hjyjhk',seconds)
    return s.dumps({'user':name}).decode('utf-8')
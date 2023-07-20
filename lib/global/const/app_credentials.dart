const baseFolder = 'Resources/';

const sheetURL =
    "https://docs.google.com/spreadsheets/d/177kj-S-RPv4Enx3rbxHCn4BTQzuVUZWupmPi_bzWc88/edit#gid=0";

const credentials = r'''
{
  "type": "service_account",
  "project_id": "gdriveindex-361205",
  "private_key_id": "cd2de6ab7d020f867e8878fa9f566a4fde3f7aba",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDX8RaBINkgC5GS\nCu3lc4YIjArlgwg6HvwmwPGW+zzMmhAVPYimhyw5DfX+IYbSYlc4nSq7g8HcrpsZ\n+6mehaf3sxiyujtv4oRZFA51yZq4bYcXUFnfSlWMkfSslcqe3O654FPJQSrnrB/k\naDih5LDzMcIWOTdHvNxe2xWvm967wiEHkpX+RazokXC28QQFb0hJHxOyqZn8M81D\nQf05yviWtdjSCkQDuWopFaA3PFYu45r7ZKTDTy4iCS2dGhOvxOcIBh0KORnkRl5V\ncRaAdNRkFkdpv6i0IbG99mKfy3Lf5K1t+19LdFlE6JGFr030kQT4UUJqTuAvX3+Z\nyJS+myGxAgMBAAECggEAAcT28z3qqYmOusyeIGgu6/kBydmmApvoYwTntd3/JIoK\nobHsYbjv0tPbdSafLTAjGNKo2/p7ZyyDFtZqEGN1+eCczjIadJM9lGFGsQ5i1yoG\nlllRMzQvuUQk5hkgHOcgiaNd7GM9T8KoTD3SYPk3vfZlabs0ScExaRGQfuzfCVjN\nA/Bg0OE3DKSqkk0vcE4gWP/Jb7lgZjvpOytQupqZfhn3VSZ7oPgoS69qaOq3IEyS\nWUUeD3k/AWrPQIMwhtHI2hm9cm4lkGBWRHIIrcjHg7wI+d79NnD/wKxFPbl0T51R\nI35aSFrwdok8EovGqR2DoKA2ImZl6Pbyz7C6R5OV8QKBgQDvMtKSMscvSAwW8hnz\n8wqizzrpDktG0233lKtAiv3m1lo4r0WByISKe3Y3tY5ItsnF7+4UcbETMGM7uCSf\nAwUwj0ZFEasDnlWL5krNWJEtVh5PY60VDAjmV10glOH8Q7JQs+uzGKYyfOlaaMDh\n/mkqvBOzvyaG6LybDP2X5prjLQKBgQDnHBIgwIPEuew4aebrIWD/hFCm0rMfYdTe\nOYgB2JiVeCd0stOkdXf3HNYvnjk8LlpbjlbxSdgJdzf6zG96ZCOBIi4upzqpzs6q\n+E1RWMX0CeSPqo72IglyaPikugOqikI2M94zQAw2SVU2Q5473Uhkawk7bWgU7oKV\nHAeLtyvbFQKBgQCbarQy1ddhuzhPuGJwhRwGCQvH3ce/byTmVqymtSif0eqxJgDN\ngNHNgMahD9AxIsMbXvecRPq+8xOm+9CfmMDIem839XDeWwROcAVuQvuhL3FmN+d/\n41/s+hrCTro+xGWZ1i1xIrTp3Qtp+OJKdJk0cRuEENEhmxrgy6ICDo3YyQKBgQCJ\nA8VjkX8NdMStNWvn3qQpGILQRH5ZjqCrFyShI45inxeVQifjipkS8g+xr3ZzTW/Y\nc+zrpEHmar3PfMBiqVe7SU5j7lUDM06nYgpEvgKuCedtnUqgddFv+PfggT+HLezP\nQbTsYX5b+OICB9iZ2Tj//807ZEOelUDpsfJvTKs9eQKBgBM6/C7tGR0jhqVkMJaI\n1odmS/z7aqUfbtAJztvWb808GVSvQZqptGC0DuSUS6G212+vlDPMxLO34aTy2TH6\nFLO0phKHAuNAxIrxdN04ixFkf1SCYTGIP7GdTwd1phJGRqsCVHC4Putgb97tYq+E\niaz4gHfQEK7MsJWj9T2D0iIa\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheet@gdriveindex-361205.iam.gserviceaccount.com",
  "client_id": "100635330651755049718",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40gdriveindex-361205.iam.gserviceaccount.com"
}
''';

const notificationServerKey =
    "AAAAr4j7JfU:APA91bGdl6EqhiITfzP1wwOXcFIlvyuH5qJzMgZEpx60RE9K_FXcsJmEEGDVUjrmxtAEhkJzBYX_aVpqNoOtUjSDxuh193tdfuMHEFdxXCBPKNRFnmp6kLtnauWJ8di5wIH0cngHNVwR";

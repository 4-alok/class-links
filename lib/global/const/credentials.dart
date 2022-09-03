const baseFolder = 'Resources/';

const sheetURL =
    "https://docs.google.com/spreadsheets/d/177kj-S-RPv4Enx3rbxHCn4BTQzuVUZWupmPi_bzWc88/edit#gid=0";

const credentials = r'''
{
  "type": "service_account",
  "project_id": "gdriveindex-361205",
  "private_key_id": "42dfd45d68fefc49d5dd922514c9b788e32b433b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDOwkyQ9P32mRK6\n0D+Q06AzJWud2jfkBZ1OKqkepZuowuA4AabD9hnLI+9Hnoejn3ge99fz6fo/Ertf\n0uKhLqv0VAM8DptShSdFfL1DdQQz6A7SLaXX4tZU9J4psHqwNCJSZbb46KTz706Y\n+Q/V40rWx2HLruynJ6ghteCdDsbNqs11rVqUojmevtAe1SKVw0+KW0c+GGS3iZrv\nggB6zYgi9HplLz9iFiF32cpowjZzHj6LZH3NpWt5cvj8YH5QbKanHJbX7qLaXUjm\nOkVgrg62YDsnAupZANlvj0OVgKUJlxEo2LyRI/2TWCxj9IWl8dN1v9wF89/36w14\nEAmXivhDAgMBAAECggEAQlPSfC4byqAQgh2MRsmc+stmWp1GkL+8VvcYidxWsyzR\nASaGeRbZ73D3seIJYVQnFMgtXvIQdWts8LCWQ17ViuvonbuR2Ece8guyK5G+Z2hq\nWMKMEVWTrG1Mz9LtiNkwqX431GHNiPOcIzbC/bqMp5oOpWjYQkdWiHnwNHIpFJDC\nLDWCS8txdV5WxxPtvPLQk/jje294maZi6XpBHNh2dvRP8LjLtZKHKnxT5tKI5awG\n2Q01SQII27BzBPpSmsg3LS5qegLyrjCbXC2UapIHbW/YUvLhtUBcGPujr02+ZoIM\nCoPYtOmn/g88Ajywf5gtIHwehn6Ya5RyjVAxbKyeAQKBgQD/gqTjjahWPxytDIHx\nn2Xr2H1WVccqitlBysDW7ocNnPQgc1u7542XkGpFrQn7oaLbJtceooGezAhg2O1m\nsCJFJiOX1VYY7GuNd/ng4HpyrZJzmkGAv5Rukv0Br5fvlk+cw4eJlKfO8YoO9E0E\nwYgQeZMalfaTeKlj49/QAuK9+wKBgQDPJ7yyPPhc7zjIm1nzlPISLOGNTJ2+i2LZ\niO3X1HBTXue4LbnXFBOu9QfkKL5F0skqcSqdobL5IA4RcsaUcl/7i2zS4Ihomb1n\nHFDyCg8nJVrDOsrm97GQWVwi+4Rm4lLrFgZY3tfJnme1k5dMuXIt1qflpKCTSht/\n3Wi9Ug0EWQKBgQD1Yqaw028DxYDowMZbItZjdnqI28B3HvofsXUZ9eJGNKJQN/m1\nsF/PW6Z0XAbmXwlkpxyaEz+hHho9yJfWsvl2p3Yvb3dMYGG6b6rPSUbPs9qeo1qd\nJ2CKAShy4gxs0FKNH0uf2eB/YoFQc1c0ZhkimV+pfLReVNd5U3Oy9dKE2QKBgFKV\npe1szxrFp96ZyFeKRqMmT1k0dSK0kNjmdON5Zrpl+Hz9hbwP3fT+7IFyGMDfUqFf\n8jxbbW1R8SnVlwMxQcCXie/b4aXJvK9xo3eKuRXDF5cDRkaj8p74cPnlSZh2m9Xq\ntucRF/fh9bh2uXe16qYJkG/FnNp7TdFA5HOtVVEpAoGAQ+WypmDT12Sbe/N9uVVn\nbj1Lhkco/qVAsFMjtXqV67S50qH0feuvXs6Cs0XlRxMs6JwpvVrKF6QJiUSfGwZF\n0FqLy7xuFdx2NakLtexY8hGuNqzPb9D569hCi/vVaeX7CM54SxVtkYK76NS3Ru7R\nolKSb/S4vaJZ5KSmu1Y4NCE=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheet@gdriveindex-361205.iam.gserviceaccount.com",
  "client_id": "100635330651755049718",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40gdriveindex-361205.iam.gserviceaccount.com"
}
''';

# AMD 서비스에서 회원 정보를 담는 Database입니다.
### 공식 사이트에 저장되어 있는 MySQL Container는 필요한 패키지가 설치되어 있지 않아 직접 커스터마이징한 MySQL Container를 만들어 배포했습니다.

# DB테이블은 다음과 같이 구성되어 있습니다.

Table_Name : amd_users
id(PRIMARY_KEY), email, name, userId, encryptedPwd, createAt

```mysql
CREATE TABLE amd_users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    create_at TIMESTAMP NOT NULL,
    email VARCHAR(50) NOT NULL,
    encrypted_pwd VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    user_id VARCHAR(255) NOT NULL
);
```


## MySQL Username : `root`  
## MySQL Password : `kubernetes-db-admin`  
## MySQL Datapath : `/var/kubernetes/mysql`

## MySQL Test Connection : `mysql -uroot -p`

### MySQL Container IP : 10.0.0.30


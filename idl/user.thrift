namespace go user

include "model.thrift"

//注册
struct RegisterRequest{
    1:required string username (api.form="username"),
    2:required string password (api.form="password"),
}

struct RegisterResponse{
    1:model.BaseResp base,
    2:model.User data,
}
//登录
struct LoginRequest{
    1:required string username (api.form="username"),
    2:required string password (api.form="password"),
    3:optional string code (api.form="code"),
}

struct LoginResponse{
    1:model.BaseResp base,
    2:model.UserInfo data,
}
//用户信息
struct InfoRequest{
    1:required string user_id (api.query="user_id"),
}

struct InfoResponse{
    1:model.BaseResp base,
    2:model.UserInfo data,
}
//上传头像
struct UploadRequest{
    1:required binary data (api.form="data"),
}

struct UploadResponse{
    1:model.BaseResp base,
    2:model.User data,

}

//获取 MFA qrcode
struct MFAGetRequest{

}

struct MFAGetResponse{
    1:model.BaseResp base,
    2:model.MFA data,

}

//绑定多因素身份认证(MFA)
struct MFABindRequest{
    1:required string code (api.form="code"),
    2:required string secret (api.form="secret"),
}

struct MFABindResponse{
    1:model.BaseResp base,
}


service UserService{
    RegisterResponse Register(1:RegisterRequest req)(api.post="/user/register"),
    LoginResponse Login(1:LoginRequest req)(api.post="/user/login"),
    InfoResponse Info(1:InfoRequest req)(api.get="/user/info"),
    UploadResponse Upload(1:UploadRequest req)(api.put="/user/avatar/upload")
    MFAGetResponse MFAGet(1:MFAGetRequest req)(api.get="/auth/mfa/qrcode")
    MFABindResponse MFA(1:MFABindRequest req)(api.post="/auth/mfa/bind")
}
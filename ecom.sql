--
-- File generated with SQLiteStudio v3.3.3 on Sat Jul 31 21:21:40 2021
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Accounts_usermodel
CREATE TABLE Accounts_usermodel (
    id           INTEGER       NOT NULL
                               PRIMARY KEY AUTOINCREMENT,
    password     VARCHAR (128) NOT NULL,
    last_login   DATETIME,
    is_superuser BOOL          NOT NULL,
    username     VARCHAR (150) NOT NULL
                               UNIQUE,
    first_name   VARCHAR (150) NOT NULL,
    last_name    VARCHAR (150) NOT NULL,
    email        VARCHAR (254) NOT NULL,
    is_staff     BOOL          NOT NULL,
    is_active    BOOL          NOT NULL,
    date_joined  DATETIME      NOT NULL,
    contact      VARCHAR (20)  NOT NULL
                               UNIQUE,
    country      VARCHAR (2)   NOT NULL,
    city         VARCHAR (100) NOT NULL,
    img          VARCHAR (100) NOT NULL
);

INSERT INTO Accounts_usermodel (
                                   id,
                                   password,
                                   last_login,
                                   is_superuser,
                                   username,
                                   first_name,
                                   last_name,
                                   email,
                                   is_staff,
                                   is_active,
                                   date_joined,
                                   contact,
                                   country,
                                   city,
                                   img
                               )
                               VALUES (
                                   1,
                                   'pbkdf2_sha256$260000$VLhCclmXzSPuoGScL3Xyjk$/uX5YKDkvwPp8kdajlXNrOgXzyVXTZI7jHfywjM76VE=',
                                   '2021-07-30 19:11:43',
                                   1,
                                   'hp',
                                   '',
                                   '',
                                   'hp@gmail.com',
                                   1,
                                   1,
                                   '2021-07-30 19:11:14',
                                   '111111',
                                   'BD',
                                   'asdfv',
                                   'User/Figure_1.png'
                               );


-- Table: Accounts_usermodel_groups
CREATE TABLE Accounts_usermodel_groups (
    id           INTEGER NOT NULL
                         PRIMARY KEY AUTOINCREMENT,
    usermodel_id BIGINT  NOT NULL
                         REFERENCES Accounts_usermodel (id) DEFERRABLE INITIALLY DEFERRED,
    group_id     INTEGER NOT NULL
                         REFERENCES auth_group (id) DEFERRABLE INITIALLY DEFERRED
);


-- Table: Accounts_usermodel_user_permissions
CREATE TABLE Accounts_usermodel_user_permissions (
    id            INTEGER NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    usermodel_id  BIGINT  NOT NULL
                          REFERENCES Accounts_usermodel (id) DEFERRABLE INITIALLY DEFERRED,
    permission_id INTEGER NOT NULL
                          REFERENCES auth_permission (id) DEFERRABLE INITIALLY DEFERRED
);


-- Table: auth_group
CREATE TABLE auth_group (
    id   INTEGER       NOT NULL
                       PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (150) NOT NULL
                       UNIQUE
);


-- Table: auth_group_permissions
CREATE TABLE auth_group_permissions (
    id            INTEGER NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    group_id      INTEGER NOT NULL
                          REFERENCES auth_group (id) DEFERRABLE INITIALLY DEFERRED,
    permission_id INTEGER NOT NULL
                          REFERENCES auth_permission (id) DEFERRABLE INITIALLY DEFERRED
);


-- Table: auth_permission
CREATE TABLE auth_permission (
    id              INTEGER       NOT NULL
                                  PRIMARY KEY AUTOINCREMENT,
    content_type_id INTEGER       NOT NULL
                                  REFERENCES django_content_type (id) DEFERRABLE INITIALLY DEFERRED,
    codename        VARCHAR (100) NOT NULL,
    name            VARCHAR (255) NOT NULL
);

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                1,
                                1,
                                'add_logentry',
                                'Can add log entry'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                2,
                                1,
                                'change_logentry',
                                'Can change log entry'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                3,
                                1,
                                'delete_logentry',
                                'Can delete log entry'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                4,
                                1,
                                'view_logentry',
                                'Can view log entry'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                5,
                                2,
                                'add_permission',
                                'Can add permission'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                6,
                                2,
                                'change_permission',
                                'Can change permission'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                7,
                                2,
                                'delete_permission',
                                'Can delete permission'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                8,
                                2,
                                'view_permission',
                                'Can view permission'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                9,
                                3,
                                'add_group',
                                'Can add group'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                10,
                                3,
                                'change_group',
                                'Can change group'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                11,
                                3,
                                'delete_group',
                                'Can delete group'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                12,
                                3,
                                'view_group',
                                'Can view group'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                13,
                                4,
                                'add_contenttype',
                                'Can add content type'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                14,
                                4,
                                'change_contenttype',
                                'Can change content type'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                15,
                                4,
                                'delete_contenttype',
                                'Can delete content type'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                16,
                                4,
                                'view_contenttype',
                                'Can view content type'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                17,
                                5,
                                'add_session',
                                'Can add session'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                18,
                                5,
                                'change_session',
                                'Can change session'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                19,
                                5,
                                'delete_session',
                                'Can delete session'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                20,
                                5,
                                'view_session',
                                'Can view session'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                21,
                                6,
                                'add_usermodel',
                                'Can add user'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                22,
                                6,
                                'change_usermodel',
                                'Can change user'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                23,
                                6,
                                'delete_usermodel',
                                'Can delete user'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                24,
                                6,
                                'view_usermodel',
                                'Can view user'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                25,
                                7,
                                'add_brandmodel',
                                'Can add brand model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                26,
                                7,
                                'change_brandmodel',
                                'Can change brand model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                27,
                                7,
                                'delete_brandmodel',
                                'Can delete brand model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                28,
                                7,
                                'view_brandmodel',
                                'Can view brand model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                29,
                                8,
                                'add_productcategorymodel',
                                'Can add product category model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                30,
                                8,
                                'change_productcategorymodel',
                                'Can change product category model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                31,
                                8,
                                'delete_productcategorymodel',
                                'Can delete product category model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                32,
                                8,
                                'view_productcategorymodel',
                                'Can view product category model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                33,
                                9,
                                'add_productmodel',
                                'Can add product model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                34,
                                9,
                                'change_productmodel',
                                'Can change product model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                35,
                                9,
                                'delete_productmodel',
                                'Can delete product model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                36,
                                9,
                                'view_productmodel',
                                'Can view product model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                37,
                                10,
                                'add_variationmodel',
                                'Can add variation model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                38,
                                10,
                                'change_variationmodel',
                                'Can change variation model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                39,
                                10,
                                'delete_variationmodel',
                                'Can delete variation model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                40,
                                10,
                                'view_variationmodel',
                                'Can view variation model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                41,
                                11,
                                'add_ordermodel',
                                'Can add order model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                42,
                                11,
                                'change_ordermodel',
                                'Can change order model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                43,
                                11,
                                'delete_ordermodel',
                                'Can delete order model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                44,
                                11,
                                'view_ordermodel',
                                'Can view order model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                45,
                                12,
                                'add_cartmodel',
                                'Can add cart model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                46,
                                12,
                                'change_cartmodel',
                                'Can change cart model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                47,
                                12,
                                'delete_cartmodel',
                                'Can delete cart model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                48,
                                12,
                                'view_cartmodel',
                                'Can view cart model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                49,
                                13,
                                'add_transactionmodel',
                                'Can add transaction model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                50,
                                13,
                                'change_transactionmodel',
                                'Can change transaction model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                51,
                                13,
                                'delete_transactionmodel',
                                'Can delete transaction model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                52,
                                13,
                                'view_transactionmodel',
                                'Can view transaction model'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                53,
                                14,
                                'add_paymentmethod',
                                'Can add payment method'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                54,
                                14,
                                'change_paymentmethod',
                                'Can change payment method'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                55,
                                14,
                                'delete_paymentmethod',
                                'Can delete payment method'
                            );

INSERT INTO auth_permission (
                                id,
                                content_type_id,
                                codename,
                                name
                            )
                            VALUES (
                                56,
                                14,
                                'view_paymentmethod',
                                'Can view payment method'
                            );


-- Table: django_admin_log
CREATE TABLE django_admin_log (
    id              INTEGER             NOT NULL
                                        PRIMARY KEY AUTOINCREMENT,
    action_time     DATETIME            NOT NULL,
    object_id       TEXT,
    object_repr     VARCHAR (200)       NOT NULL,
    change_message  TEXT                NOT NULL,
    content_type_id INTEGER
                                        REFERENCES django_content_type (id) DEFERRABLE INITIALLY DEFERRED,
    user_id         BIGINT              NOT NULL
                                        REFERENCES Accounts_usermodel (id) DEFERRABLE INITIALLY DEFERRED,
    action_flag     [SMALLINT UNSIGNED] NOT NULL
                                        CHECK ("action_flag" >= 0) 
);

INSERT INTO django_admin_log (
                                 id,
                                 action_time,
                                 object_id,
                                 object_repr,
                                 change_message,
                                 content_type_id,
                                 user_id,
                                 action_flag
                             )
                             VALUES (
                                 1,
                                 '2021-07-31 04:50:44.817856',
                                 '2',
                                 'botal',
                                 '',
                                 9,
                                 1,
                                 3
                             );

INSERT INTO django_admin_log (
                                 id,
                                 action_time,
                                 object_id,
                                 object_repr,
                                 change_message,
                                 content_type_id,
                                 user_id,
                                 action_flag
                             )
                             VALUES (
                                 2,
                                 '2021-07-31 08:04:36.743931',
                                 '1',
                                 'hp',
                                 '[{"changed": {"fields": ["Contact", "Country", "City", "Img"]}}]',
                                 6,
                                 1,
                                 2
                             );


-- Table: django_content_type
CREATE TABLE django_content_type (
    id        INTEGER       NOT NULL
                            PRIMARY KEY AUTOINCREMENT,
    app_label VARCHAR (100) NOT NULL,
    model     VARCHAR (100) NOT NULL
);

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    1,
                                    'admin',
                                    'logentry'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    2,
                                    'auth',
                                    'permission'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    3,
                                    'auth',
                                    'group'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    4,
                                    'contenttypes',
                                    'contenttype'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    5,
                                    'sessions',
                                    'session'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    6,
                                    'Accounts',
                                    'usermodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    7,
                                    'Shop',
                                    'brandmodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    8,
                                    'Shop',
                                    'productcategorymodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    9,
                                    'Shop',
                                    'productmodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    10,
                                    'Shop',
                                    'variationmodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    11,
                                    'Shop',
                                    'ordermodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    12,
                                    'Shop',
                                    'cartmodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    13,
                                    'Payment',
                                    'transactionmodel'
                                );

INSERT INTO django_content_type (
                                    id,
                                    app_label,
                                    model
                                )
                                VALUES (
                                    14,
                                    'Payment',
                                    'paymentmethod'
                                );


-- Table: django_migrations
CREATE TABLE django_migrations (
    id      INTEGER       NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    app     VARCHAR (255) NOT NULL,
    name    VARCHAR (255) NOT NULL,
    applied DATETIME      NOT NULL
);

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  1,
                                  'contenttypes',
                                  '0001_initial',
                                  '2021-07-30 19:10:38.377546'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  2,
                                  'contenttypes',
                                  '0002_remove_content_type_name',
                                  '2021-07-30 19:10:38.486936'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  3,
                                  'auth',
                                  '0001_initial',
                                  '2021-07-30 19:10:38.674509'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  4,
                                  'auth',
                                  '0002_alter_permission_name_max_length',
                                  '2021-07-30 19:10:38.782118'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  5,
                                  'auth',
                                  '0003_alter_user_email_max_length',
                                  '2021-07-30 19:10:38.862350'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  6,
                                  'auth',
                                  '0004_alter_user_username_opts',
                                  '2021-07-30 19:10:38.947348'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  7,
                                  'auth',
                                  '0005_alter_user_last_login_null',
                                  '2021-07-30 19:10:39.028717'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  8,
                                  'auth',
                                  '0006_require_contenttypes_0002',
                                  '2021-07-30 19:10:39.122614'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  9,
                                  'auth',
                                  '0007_alter_validators_add_error_messages',
                                  '2021-07-30 19:10:39.200600'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  10,
                                  'auth',
                                  '0008_alter_user_username_max_length',
                                  '2021-07-30 19:10:39.294357'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  11,
                                  'auth',
                                  '0009_alter_user_last_name_max_length',
                                  '2021-07-30 19:10:39.387109'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  12,
                                  'auth',
                                  '0010_alter_group_name_max_length',
                                  '2021-07-30 19:10:39.474520'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  13,
                                  'auth',
                                  '0011_update_proxy_permissions',
                                  '2021-07-30 19:10:39.557043'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  14,
                                  'auth',
                                  '0012_alter_user_first_name_max_length',
                                  '2021-07-30 19:10:39.642535'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  15,
                                  'Accounts',
                                  '0001_initial',
                                  '2021-07-30 19:10:39.820173'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  16,
                                  'Payment',
                                  '0001_initial',
                                  '2021-07-30 19:10:40.033400'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  17,
                                  'Shop',
                                  '0001_initial',
                                  '2021-07-30 19:10:40.260169'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  18,
                                  'admin',
                                  '0001_initial',
                                  '2021-07-30 19:10:40.432033'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  19,
                                  'admin',
                                  '0002_logentry_remove_auto_add',
                                  '2021-07-30 19:10:40.541402'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  20,
                                  'admin',
                                  '0003_logentry_add_action_flag_choices',
                                  '2021-07-30 19:10:40.650770'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  21,
                                  'sessions',
                                  '0001_initial',
                                  '2021-07-30 19:10:40.822642'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  22,
                                  'Shop',
                                  '0002_remove_variationmodel_brand',
                                  '2021-07-30 19:12:26.106923'
                              );

INSERT INTO django_migrations (
                                  id,
                                  app,
                                  name,
                                  applied
                              )
                              VALUES (
                                  23,
                                  'Shop',
                                  '0003_alter_cartmodel_created_on',
                                  '2021-07-31 09:18:21.744588'
                              );


-- Table: django_session
CREATE TABLE django_session (
    session_key  VARCHAR (40) NOT NULL
                              PRIMARY KEY,
    session_data TEXT         NOT NULL,
    expire_date  DATETIME     NOT NULL
);

INSERT INTO django_session (
                               session_key,
                               session_data,
                               expire_date
                           )
                           VALUES (
                               'bem397baej83ygc1y6vv3x5umbq4cssb',
                               '.eJxVjDsOwjAQBe_iGln-rY0p6XMGa-3d4ABypDipEHeHSCmgfTPzXiLhtta0dV7SROIitDj9bhnLg9sO6I7tNssyt3WZstwVedAuh5n4eT3cv4OKvX5rdMgIisag45mRbVZYIFgcS3Fgg_Ge2EOmyKwZKBvlbETPXkUDYMX7Aw1cOFw:1m9Xv6:GRwiO5HByUYULVnfrfCuMZF_-g-upMqDbmGC83h7ov4',
                               '2021-08-13 19:11:44.113961'
                           );


-- Table: Payment_paymentmethod
CREATE TABLE Payment_paymentmethod (
    id           INTEGER       NOT NULL
                               PRIMARY KEY AUTOINCREMENT,
    payment_type VARCHAR (100) NOT NULL,
    account      VARCHAR (50)  NOT NULL,
    user_id      BIGINT        NOT NULL
                               REFERENCES Accounts_usermodel (id) DEFERRABLE INITIALLY DEFERRED
);


-- Table: Payment_transactionmodel
CREATE TABLE Payment_transactionmodel (
    id                       INTEGER       NOT NULL
                                           PRIMARY KEY AUTOINCREMENT,
    amount                   DECIMAL       NOT NULL,
    tran_id                  VARCHAR (15)  NOT NULL,
    val_id                   VARCHAR (75)  NOT NULL,
    card_type                VARCHAR (150) NOT NULL,
    store_amount             DECIMAL       NOT NULL,
    card_no                  VARCHAR (55),
    bank_tran_id             VARCHAR (155),
    status                   VARCHAR (55)  NOT NULL,
    tran_date                DATETIME      NOT NULL,
    currency                 VARCHAR (10)  NOT NULL,
    card_issuer              VARCHAR (255) NOT NULL,
    card_brand               VARCHAR (15)  NOT NULL,
    card_issuer_country      VARCHAR (55)  NOT NULL,
    card_issuer_country_code VARCHAR (55)  NOT NULL,
    currency_rate            DECIMAL       NOT NULL,
    verify_sign              VARCHAR (155) NOT NULL,
    verify_sign_sha2         VARCHAR (255) NOT NULL,
    risk_level               VARCHAR (15)  NOT NULL,
    risk_title               VARCHAR (25)  NOT NULL,
    reason                   VARCHAR (30)  NOT NULL,
    user_id                  BIGINT        NOT NULL
                                           REFERENCES Accounts_usermodel (id) DEFERRABLE INITIALLY DEFERRED
);


-- Table: Shop_brandmodel
CREATE TABLE Shop_brandmodel (
    id   INTEGER       NOT NULL
                       PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (100) NOT NULL
                       UNIQUE
);

INSERT INTO Shop_brandmodel (
                                id,
                                name
                            )
                            VALUES (
                                1,
                                'olympic'
                            );

INSERT INTO Shop_brandmodel (
                                id,
                                name
                            )
                            VALUES (
                                2,
                                'ACI'
                            );


-- Table: Shop_cartmodel
CREATE TABLE Shop_cartmodel (
    id           INTEGER     NOT NULL
                             PRIMARY KEY AUTOINCREMENT,
    quantity     VARCHAR (5) NOT NULL,
    user_id      BIGINT      NOT NULL
                             REFERENCES Accounts_usermodel (id) DEFERRABLE INITIALLY DEFERRED,
    variation_id BIGINT      NOT NULL
                             REFERENCES Shop_variationmodel (id) DEFERRABLE INITIALLY DEFERRED,
    created_on   DATETIME    NOT NULL
);

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               1,
                               '3',
                               1,
                               1,
                               '2021-07-31'
                           );

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               2,
                               '2',
                               1,
                               2,
                               '2021-07-31'
                           );

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               3,
                               '1',
                               1,
                               2,
                               '2021-07-31 09:18:33.237871'
                           );

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               4,
                               '1',
                               1,
                               1,
                               '2021-07-31 09:22:59.711354'
                           );

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               5,
                               '1',
                               1,
                               1,
                               '2021-07-31 09:23:07.206857'
                           );

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               6,
                               '1',
                               1,
                               1,
                               '2021-07-31 09:23:09.125783'
                           );

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               7,
                               '1',
                               1,
                               2,
                               '2021-07-31 09:23:12.262481'
                           );

INSERT INTO Shop_cartmodel (
                               id,
                               quantity,
                               user_id,
                               variation_id,
                               created_on
                           )
                           VALUES (
                               8,
                               '1',
                               1,
                               1,
                               '2021-07-31 09:23:14.693377'
                           );


-- Table: Shop_ordermodel
CREATE TABLE Shop_ordermodel (
    id         INTEGER      NOT NULL
                            PRIMARY KEY AUTOINCREMENT,
    quantity   VARCHAR (5)  NOT NULL,
    price      VARCHAR (10) NOT NULL,
    discount   VARCHAR (2)  NOT NULL,
    created_on DATE         NOT NULL,
    product_id BIGINT       NOT NULL
                            REFERENCES Shop_productmodel (id) DEFERRABLE INITIALLY DEFERRED,
    user_id    BIGINT       NOT NULL
                            REFERENCES Accounts_usermodel (id) DEFERRABLE INITIALLY DEFERRED
);


-- Table: Shop_productcategorymodel
CREATE TABLE Shop_productcategorymodel (
    id         INTEGER       NOT NULL
                             PRIMARY KEY AUTOINCREMENT,
    name       VARCHAR (100) NOT NULL,
    created_on DATE          NOT NULL,
    brand_id   BIGINT
                             REFERENCES Shop_brandmodel (id) DEFERRABLE INITIALLY DEFERRED
);

INSERT INTO Shop_productcategorymodel (
                                          id,
                                          name,
                                          created_on,
                                          brand_id
                                      )
                                      VALUES (
                                          1,
                                          'Biscuit',
                                          '2021-07-31',
                                          1
                                      );

INSERT INTO Shop_productcategorymodel (
                                          id,
                                          name,
                                          created_on,
                                          brand_id
                                      )
                                      VALUES (
                                          2,
                                          'botal',
                                          '2021-07-31',
                                          1
                                      );


-- Table: Shop_productmodel
CREATE TABLE Shop_productmodel (
    id          INTEGER       NOT NULL
                              PRIMARY KEY AUTOINCREMENT,
    name        VARCHAR (100) NOT NULL,
    description TEXT          NOT NULL,
    created_on  DATE          NOT NULL,
    updated_on  DATE          NOT NULL,
    brand_id    BIGINT
                              REFERENCES Shop_brandmodel (id) DEFERRABLE INITIALLY DEFERRED,
    category_id BIGINT
                              REFERENCES Shop_productcategorymodel (id) DEFERRABLE INITIALLY DEFERRED
);

INSERT INTO Shop_productmodel (
                                  id,
                                  name,
                                  description,
                                  created_on,
                                  updated_on,
                                  brand_id,
                                  category_id
                              )
                              VALUES (
                                  1,
                                  'energy',
                                  'asdfghjkl./',
                                  '2021-07-31',
                                  '2021-07-31',
                                  1,
                                  1
                              );

INSERT INTO Shop_productmodel (
                                  id,
                                  name,
                                  description,
                                  created_on,
                                  updated_on,
                                  brand_id,
                                  category_id
                              )
                              VALUES (
                                  3,
                                  'water',
                                  'aqswdefrgthyju',
                                  '2021-07-31',
                                  '2021-07-31',
                                  1,
                                  2
                              );


-- Table: Shop_variationmodel
CREATE TABLE Shop_variationmodel (
    id               INTEGER       NOT NULL
                                   PRIMARY KEY AUTOINCREMENT,
    quantity         VARCHAR (5)   NOT NULL,
    size             VARCHAR (50)  NOT NULL,
    color            VARCHAR (100) NOT NULL,
    sold             VARCHAR (5)   NOT NULL,
    expensive_to_buy VARCHAR (5)   NOT NULL,
    selling_price    VARCHAR (5)   NOT NULL,
    discount         VARCHAR (2)   NOT NULL,
    is_discount      BOOL          NOT NULL,
    discount_price   VARCHAR (100) NOT NULL,
    img              VARCHAR (100) NOT NULL,
    is_available     BOOL          NOT NULL,
    created_on       DATETIME      NOT NULL,
    category_id      BIGINT
                                   REFERENCES Shop_productcategorymodel (id) DEFERRABLE INITIALLY DEFERRED,
    product_id       BIGINT        NOT NULL
                                   REFERENCES Shop_productmodel (id) DEFERRABLE INITIALLY DEFERRED
);

INSERT INTO Shop_variationmodel (
                                    id,
                                    quantity,
                                    size,
                                    color,
                                    sold,
                                    expensive_to_buy,
                                    selling_price,
                                    discount,
                                    is_discount,
                                    discount_price,
                                    img,
                                    is_available,
                                    created_on,
                                    category_id,
                                    product_id
                                )
                                VALUES (
                                    1,
                                    '100',
                                    'mini',
                                    'blue',
                                    '0',
                                    '9',
                                    '15',
                                    '5',
                                    1,
                                    '0.75',
                                    'product/olympic-premium-energy-plus-biscuit-80-gm.jpg',
                                    0,
                                    '2021-07-30 19:15:01.827300',
                                    1,
                                    1
                                );

INSERT INTO Shop_variationmodel (
                                    id,
                                    quantity,
                                    size,
                                    color,
                                    sold,
                                    expensive_to_buy,
                                    selling_price,
                                    discount,
                                    is_discount,
                                    discount_price,
                                    img,
                                    is_available,
                                    created_on,
                                    category_id,
                                    product_id
                                )
                                VALUES (
                                    2,
                                    '100',
                                    'small',
                                    'blue',
                                    '0',
                                    '12',
                                    '18',
                                    '5',
                                    1,
                                    '0.9',
                                    'product/istockphoto-611328454-1024x1024.jpg',
                                    0,
                                    '2021-07-31 05:00:19.345324',
                                    2,
                                    3
                                );


-- Index: Accounts_usermodel_groups_group_id_ff3e0b74
CREATE INDEX Accounts_usermodel_groups_group_id_ff3e0b74 ON Accounts_usermodel_groups (
    "group_id"
);


-- Index: Accounts_usermodel_groups_usermodel_id_90bea4f4
CREATE INDEX Accounts_usermodel_groups_usermodel_id_90bea4f4 ON Accounts_usermodel_groups (
    "usermodel_id"
);


-- Index: Accounts_usermodel_groups_usermodel_id_group_id_04ba16fe_uniq
CREATE UNIQUE INDEX Accounts_usermodel_groups_usermodel_id_group_id_04ba16fe_uniq ON Accounts_usermodel_groups (
    "usermodel_id",
    "group_id"
);


-- Index: Accounts_usermodel_user_permissions_permission_id_cbaddd52
CREATE INDEX Accounts_usermodel_user_permissions_permission_id_cbaddd52 ON Accounts_usermodel_user_permissions (
    "permission_id"
);


-- Index: Accounts_usermodel_user_permissions_usermodel_id_8c2a5065
CREATE INDEX Accounts_usermodel_user_permissions_usermodel_id_8c2a5065 ON Accounts_usermodel_user_permissions (
    "usermodel_id"
);


-- Index: Accounts_usermodel_user_permissions_usermodel_id_permission_id_fe5fb953_uniq
CREATE UNIQUE INDEX Accounts_usermodel_user_permissions_usermodel_id_permission_id_fe5fb953_uniq ON Accounts_usermodel_user_permissions (
    "usermodel_id",
    "permission_id"
);


-- Index: auth_group_permissions_group_id_b120cbf9
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions (
    "group_id"
);


-- Index: auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON auth_group_permissions (
    "group_id",
    "permission_id"
);


-- Index: auth_group_permissions_permission_id_84c5c92e
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions (
    "permission_id"
);


-- Index: auth_permission_content_type_id_2f476e4b
CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission (
    "content_type_id"
);


-- Index: auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON auth_permission (
    "content_type_id",
    "codename"
);


-- Index: django_admin_log_content_type_id_c4bce8eb
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log (
    "content_type_id"
);


-- Index: django_admin_log_user_id_c564eba6
CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log (
    "user_id"
);


-- Index: django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON django_content_type (
    "app_label",
    "model"
);


-- Index: django_session_expire_date_a5c62663
CREATE INDEX django_session_expire_date_a5c62663 ON django_session (
    "expire_date"
);


-- Index: Payment_paymentmethod_user_id_f17e6898
CREATE INDEX Payment_paymentmethod_user_id_f17e6898 ON Payment_paymentmethod (
    "user_id"
);


-- Index: Payment_transactionmodel_user_id_48fe5073
CREATE INDEX Payment_transactionmodel_user_id_48fe5073 ON Payment_transactionmodel (
    "user_id"
);


-- Index: Shop_cartmodel_user_id_2dddffae
CREATE INDEX Shop_cartmodel_user_id_2dddffae ON Shop_cartmodel (
    "user_id"
);


-- Index: Shop_cartmodel_variation_id_4a86dc9b
CREATE INDEX Shop_cartmodel_variation_id_4a86dc9b ON Shop_cartmodel (
    "variation_id"
);


-- Index: Shop_ordermodel_product_id_b2d33640
CREATE INDEX Shop_ordermodel_product_id_b2d33640 ON Shop_ordermodel (
    "product_id"
);


-- Index: Shop_ordermodel_user_id_8f1851fe
CREATE INDEX Shop_ordermodel_user_id_8f1851fe ON Shop_ordermodel (
    "user_id"
);


-- Index: Shop_productcategorymodel_brand_id_36fe2bca
CREATE INDEX Shop_productcategorymodel_brand_id_36fe2bca ON Shop_productcategorymodel (
    "brand_id"
);


-- Index: Shop_productmodel_brand_id_584ab82b
CREATE INDEX Shop_productmodel_brand_id_584ab82b ON Shop_productmodel (
    "brand_id"
);


-- Index: Shop_productmodel_category_id_a6eef477
CREATE INDEX Shop_productmodel_category_id_a6eef477 ON Shop_productmodel (
    "category_id"
);


-- Index: Shop_variationmodel_category_id_6b29fa14
CREATE INDEX Shop_variationmodel_category_id_6b29fa14 ON Shop_variationmodel (
    "category_id"
);


-- Index: Shop_variationmodel_product_id_0aebd5e5
CREATE INDEX Shop_variationmodel_product_id_0aebd5e5 ON Shop_variationmodel (
    "product_id"
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

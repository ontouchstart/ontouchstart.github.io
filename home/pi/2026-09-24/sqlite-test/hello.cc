#include <node.h>
#include <sqlite3.h>
#include <stdio.h>

// Define the callback for sqlite3_exec
int sqlite_callback(void *ctx, int argc, char **argv, char **pzErrMsg) {
    if (argv[0]) {
        printf("Native Result: %s\n", argv[0]);
    }
    return SQLITE_OK;
}

// N-API function to run a sqlite query
napi_value RunSqliteQuery(napi_env env, napi_callback_info info) {
    sqlite3 *db;
    int rc = sqlite3_open(":memory:", &db);
    if (rc == SQLITE_OK) {
        printf("Native: Successfully opened in-memory database\n");
        sqlite3_exec(db, "CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT);", NULL, 0, NULL);
        sqlite3_exec(db, "INSERT INTO test (name) VALUES ('Native SQLite test');", NULL, 0, NULL);
        
        char *zErrMsg = 0;
        rc = sqlite3_exec(db, "SELECT name FROM test;", sqlite_callback, 0, &zErrMsg);
        
        if (rc != SQLITE_OK) {
            fprintf(stderr, "Native SQL error: %s\n", zErrMsg);
            sqlite3_free(zErrMsg);
        }
        
        sqlite3_close(db);
    } else {
        fprintf(stderr, "Native: Can't open database: %s\n", sqlite3_errmsg(db));
    }
    
    napi_value result;
    napi_create_string_utf8(env, "Success", NAPI_AUTO_LENGTH, &result);
    return result;
}

// Module initialization
napi_value Init(napi_env env, napi_value exports) {
    napi_value fn;
    // Fix: provide argc=0 and data=NULL
    napi_create_function(env, "runQuery", 0, RunSqliteQuery, NULL, &fn);
    napi_set_named_property(env, exports, "runQuery", fn);
    return exports;
}

// N-API module registration
NAPI_MODULE(NODE_GYP_MODULE_NAME, Init)

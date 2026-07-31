"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
const pi = __importStar(require("/usr/local/lib/node_modules/@earendil-works/pi-coding-agent/dist/index.js"));
const { SessionManager, createAgentSession } = pi;
async function parseSession(sessionPath) {
    try {
        console.log(`Attempting to open session: ${sessionPath}`);
        const { session } = await createAgentSession({
            sessionManager: SessionManager.open(sessionPath),
        });
        const sm = session.sessionManager;
        console.log(`--- Session Metadata ---`);
        console.log(`ID: ${session.sessionId}`);
        console.log(`CWD: ${sm.cwd}`);
        console.log(`File: ${sm.sessionFile}`);
        console.log(`Name: ${session.sessionName}`);
        console.log(`\n--- Session Tree ---`);
        const tree = sm.getTree();
        const entries = Object.keys(tree);
        console.log(`Total entries in tree: ${entries.length}`);
        if (entries.length > 0) {
            console.log(`Sample entry 1: ${JSON.stringify(tree[entries[0]], null, 2)}`);
        }
        if (entries.length > 1) {
            console.log(`Sample entry 2: ${JSON.stringify(tree[entries[1]], null, 2)}`);
        }
        console.log(`\n--- Active Entries (Context) ---`);
        const contextEntries = sm.buildContextEntries();
        for (const entry of contextEntries) {
            console.log(`[${entry.timestamp}] Type: ${entry.type} | ID: ${entry.id}`);
            if (entry.type === "message" && entry.message) {
                const role = entry.message.role;
                const content = JSON.stringify(entry.message.content);
                console.log(`  -> ${role}: ${content.substring(0, 100)}${content.length > 100 ? '...' : ''}`);
            }
            else if (entry.type === "compaction") {
                console.log(`  -> Compaction: ${entry.summary}`);
            }
            else if (entry.type === "model_change") {
                console.log(`  -> Model Changed: ${entry.provider}/${entry.modelId}`);
            }
        }
        console.log(`\n--- Summary ---`);
        console.log(`Context entries count: ${contextEntries.length}`);
        session.dispose();
    }
    catch (error) {
        console.error("Error parsing session:", error);
    }
}
const path = "/root/.pi/agent/sessions/--home-pi-random-2026-07-31--/2026-07-31T18-11-28-299Z_019fb95f-c1ab-7dc7-b157-268a9a1226bf.jsonl";
parseSession(path);

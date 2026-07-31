import * as pi from "/usr/local/lib/node_modules/@earendil-works/pi-coding-agent/dist/index.js";
const { SessionManager, createAgentSession } = pi;

async function parseSession(sessionPath: string) {
  try {
    console.log(`Attempting to open session: ${sessionPath}`);
    
    const { session } = await createAgentSession({
      sessionManager: SessionManager.open(sessionPath),
    });

    const sm = session.sessionManager as any;

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
        const content = JSON.stringify((entry.message as any).content);
        console.log(`  -> ${role}: ${content.substring(0, 100)}${content.length > 100 ? '...' : ''}`);
      } else if (entry.type === "compaction") {
        console.log(`  -> Compaction: ${entry.summary}`);
      } else if (entry.type === "model_change") {
        console.log(`  -> Model Changed: ${entry.provider}/${entry.modelId}`);
      }
    }

    console.log(`\n--- Summary ---`);
    console.log(`Context entries count: ${contextEntries.length}`);

    session.dispose();
  } catch (error) {
    console.error("Error parsing session:", error);
  }
}

const path = "/root/.pi/agent/sessions/--home-pi-random-2026-07-31--/2026-07-31T18-11-28-299Z_019fb95f-c1ab-7dc7-b157-268a9a1226bf.jsonl";
parseSession(path);

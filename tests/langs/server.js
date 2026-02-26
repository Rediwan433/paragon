const http = require("http");
const fs = require("fs");
const path = require("path");

const PORT = process.env.PORT || 3000;

const MIME_TYPES = {
    ".html": "text/html",
    ".js": "application/javascript",
    ".css": "text/css",
    ".json": "application/json",
    ".png": "image/png",
    ".svg": "image/svg+xml",
};

function getMimeType(filePath) {
    const ext = path.extname(filePath).toLowerCase();
    return MIME_TYPES[ext] || "application/octet-stream";
}

async function handleRequest(req, res) {
    console.log(`${req.method} ${req.url}`);

    let filePath = path.join(__dirname, "public", req.url === "/" ? "index.html" : req.url);

    try {
        const content = await fs.promises.readFile(filePath);
        const mimeType = getMimeType(filePath);

        res.writeHead(200, { "Content-Type": mimeType });
        res.end(content);
    } catch (err) {
        if (err.code === "ENOENT") {
            res.writeHead(404, { "Content-Type": "text/plain" });
            res.end("404 Not Found");
        } else {
            res.writeHead(500, { "Content-Type": "text/plain" });
            res.end("500 Internal Server Error");
        }
    }
}

const server = http.createServer(handleRequest);

server.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}/`);
});

process.on("SIGTERM", () => {
    console.log("Shutting down gracefully...");
    server.close(() => {
        process.exit(0);
    });
});

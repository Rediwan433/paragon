interface Request {
    method: string;
    url: string;
    headers: Record<string, string>;
}

interface Response {
    writeHead: (status: number, headers: Record<string, string>) => void;
    end: (data?: string) => void;
}

type RequestHandler = (req: Request, res: Response) => Promise<void>;

interface ServerOptions {
    port: number;
    hostname?: string;
}

class HttpServer {
    private port: number;
    private hostname: string;
    private handlers: Map<string, RequestHandler> = new Map();

    constructor(options: ServerOptions) {
        this.port = options.port;
        this.hostname = options.hostname || "localhost";
    }

    get(path: string, handler: RequestHandler): void {
        this.handlers.set(`GET:${path}`, handler);
    }

    post(path: string, handler: RequestHandler): void {
        this.handlers.set(`POST:${path}`, handler);
    }

    async handleRequest(req: Request, res: Response): Promise<void> {
        const key = `${req.method}:${req.url}`;
        const handler = this.handlers.get(key);

        if (!handler) {
            res.writeHead(404, { "Content-Type": "application/json" });
            res.end(JSON.stringify({ error: "Not Found" }));
            return;
        }

        try {
            await handler(req, res);
        } catch (error) {
            console.error("Request handler error:", error);
            res.writeHead(500, { "Content-Type": "application/json" });
            res.end(JSON.stringify({ error: "Internal Server Error" }));
        }
    }

    start(): void {
        console.log(`Server listening on http://${this.hostname}:${this.port}`);
    }
}

export { HttpServer, Request, Response, RequestHandler, ServerOptions };

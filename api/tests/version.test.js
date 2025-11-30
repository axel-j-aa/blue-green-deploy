const request = require("supertest");
const app = require("../app");

describe("GET /version", () => {
  it("Debe responder 200 y la versión", async () => {
    const res = await request(app).get("/version");
    expect(res.statusCode).toBe(200);
    expect(res.body.version).toBe("1.0.0");
  });
});

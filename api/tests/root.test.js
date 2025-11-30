const request = require("supertest");
const app = require("../app");

describe("GET /", () => {
  it("Debe responder 200 y mensaje correcto", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
    expect(res.body.message).toBe("Blue-Green API Root");
  });
});

import { PrismaClient } from "@prisma/client"
let prisma = PrismaClient

if (process.env.NODE_ENV === 'production') {
    prisma = new PrismaClient();
} else {
    // Ensure the prisma instance is re-used during hot-reloading
    // Otherwise, a new client will be created on every reload
    globalThis['prisma'] = globalThis['prisma'] || new PrismaClient();
    prisma = globalThis['prisma'];
    // Many thanks to kripod for this fix:
    // https://github.com/blitz-js/blitz/blob/canary/examples/tailwind/db/index.ts
}
export const context = {
    try {

    } catch(error) {
        console.log(user: {}, prisma)
    }
}
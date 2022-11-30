const admin = require("firebase-admin")
const express = require("express")
const cors = require("cors")

const credentials = require("./serviceAccountKey.json")

admin.initializeApp({
    credential: admin.credential.cert(credentials)
})

const app = express()

app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(cors())


function checkAuthMiddleware(req, res, next) {
    if (req.headers.token) {
        admin.auth().verifyIdToken(req.headers.token)
            .then(() => next())
            .catch(() => {
                res.status(403).send('Unauthorized)')
            })
    } else {
        res.status(403).send("Unauthorized)")
    }
}

app.use('/profile', checkAuthMiddleware)

app.get('/profile', (req, res) => {
    res.json({
        firstName: "Nice",
        lastName: "User",
        uniqueName: "@niceuser",
        email: "niceuser@gmail.com",
        message: "YOU ARE AUTHENTICATED"
    })
})


const PORT = process.env.PORT || 8000

app.listen(PORT, () => {
    console.log(`SERVER IS RUNNING ON PORT ${PORT}`)
})
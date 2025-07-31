const db = require('../utils/dbpool')
const express = require('express')
const router = express.Router()
const bcrypt = require('bcrypt')

//POST 
// /users/signin
router.post('/signin', (req, resp) => {
     const {email, password} = req.body
     console.log(req)
     //console.log(req.url + " - " + req.method + " : " + email + " & " + passwd)
     db.query('select * from users where email=?', [email], (err, results) => {
        if (err) return resp.send(apiError(err))
            //console.log("results: ", results)
        if (results.length !== 1)
            //user with email not found
            return resp.send(apiError('Invalid email'))
        const dbUser = results[0]
        const isMatching = bcrypt.compareSync(password, dbUser.password)
        //console.log("is passwd matching: ", isMatching)
        if (!isMatching)
            //password not matching
            return resp.send(apiError('Invalid password'))
        //create jwt token and add it in response
        const token = createToken(dbUser)
        resp.send(apiSuccess({...dbUser, token})) //password matched for this user     
     })
})
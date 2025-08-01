const db = require('../utils/dbpool')
const express = require('express')
const router = express.Router()
const bcrypt = require('bcrypt')
const result = require('../utils/result')

//POST 
// /users/signin
router.post('/signin', (req, resp) => {
     const {email, password} = req.body
     console.log(req)
     //console.log(req.url + " - " + req.method + " : " + email + " & " + passwd)
     db.query('select * from users where email=?', [email, password], (err, results) => {
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

// router.get('/byemail/:id', (req, resp) => {
//     db.query(
//         'SELECT * from users WHERE id=?',
//         [req.params.id],
//         (err, results) => {
//             if (err) return resp.send(apiError(err))
//             if (results.length !== 1){
//                 return resp.send(apiError('User not found'))
//             }    
//             return resp.send(apiSuccess(results[0]))
//         }
//     )
// })

// GET /users/byid/:id
// router.get('/byid/:id', (req, resp) => {
//     const userId = req.params.id

//     db.query(
//         'SELECT * FROM users WHERE id = ?',
//         [userId],
//         (err, results) => {
//             if (err) return resp.send(apiError(err))

//             if (results.length !== 1) {
//                 return resp.send(apiError('User not found'))
//             }

//             // Optionally remove password before sending user
//             const { password, ...userWithoutPassword } = results[0]

//             return resp.send(apiSuccess(userWithoutPassword))
//         }
//     )
// })

router,get('/')

module.exports = router
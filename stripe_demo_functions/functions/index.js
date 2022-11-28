const functions = require("firebase-functions");
const stripe = require('stripe')(functions.config().stripe.testkey)

exports.StripePI = functions.https.onRequest(async (req,res) => {
    const stripeVendorAccount = 'acct_1M8ylHESlXamnSUl'

    const fee = (req.query.amount/100) | 0;

    stripe.paymentMethods.create({
        payment_method: req.query.paym,
    }, {
        stripeAccount: stripeVendorAccount
    },
    function(err,clonedPaymentMethod) {
        if(err !== null) {
            console.log('Error clone: ', err);
            res.send('error');
        } else {
            console.log('clonedPaymentMethod: ', clonedPaymentMethod);

            stripe.paymentIntents.create({
                amount: req.query.amount,
                currency: req.query.currency,
                payment_method: clonedPaymentMethod.id,
                confirmation_method: 'automatic',
                confirm: true,
                application_fee_amount: fee,
                description: req.query.description,
            }, {
                stripeAccount: stripeVendorAccount
            },
            function(err,paymentIntent) {
                const paymentIntentReference = paymentIntent;

                if(err !== null) {
                    console.log('Error payment Intent: ',err);
                    res.send('error');
                } else{
                    console.log('Created paymentIntent: ',paymentIntent);
                    res.json({
                        paymentIntent: paymentIntent,
                        stripeAccount: stripeVendorAccount
                    });
                }
            })
        }
    })

})

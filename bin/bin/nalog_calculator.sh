#!/usr/bin/env python3
import re
import requests
import os

log_file = os.environ["HOME"] + "/Documents/nalog_ge.log"

payment_date = input("Enter date in form 2023-06-02: ")
payment_amount = float(input("Enter payment amount in EUR: "))
payment_amount_total_last = float(input("Enter last total from year start: "))

r = requests.get("https://nbg.gov.ge/gw/api/ct/monetarypolicy/currencies/en/rss/?currencies=EUR&date=" + payment_date)
m = re.search(r"<td>1 Euro<\/td>[\s\t\n]+<td>([\d\.]+)<\/td>", r.text, re.M)
curs = float(m.group(1))

payment_amount_gel = round(payment_amount * curs, 4)
payment_amount_total = round(payment_amount_gel + payment_amount_total_last, 4)

report = f"""Payment amount total last: {payment_amount_total_last}
Payment date: {payment_date}
Payment amount in EUR: {payment_amount}
Curs: {curs}
Payment amount in GEL: {payment_amount_gel}
Payment amount total: {payment_amount_total}

"""
print(report)

with open(log_file, "a") as f:
    f.write(report)

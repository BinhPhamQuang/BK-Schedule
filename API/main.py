from bs4 import BeautifulSoup
from flask import Flask, request, jsonify, Response
import requests
import json



def formatSubject(subject):
    jsona = {"course_id": subject[0],
             "course_name": subject[1],
             "tc": subject[2],
             "class": subject[4],
             "thu": subject[5],
             "tiet": subject[6],
             "time_start": subject[7].split(' ')[0],
             "time_end": subject[7].split(' ')[-1],
             "room": subject[8],
             "location": subject[9],
             "week": [int(s) for s in subject[10].split('|') if s.isdigit()]
             }
    return jsona


def formatSubjects(subjects):
    total_credits = subjects[-1]
    result = []
    for subject in subjects[0:-1]:
        result.append(formatSubject(subject))
    result.append({total_credits[0]})
    return result



 
 

 

def runData(username,password):
    url='https://parsehub.com/api/v2/projects/tnV95-DM1BV8/run?api_key=t4jcktThdW64&start_value_override ={"username":"'+username+'","password":"'+password+'"}'
    request=requests.post(url=url)
    return request.json()["run_token"]








def get_run(run_token):
    check_run="https://www.parsehub.com/api/v2/runs/"+run_token+"?api_key=t4jcktThdW64"
    response=requests.get(url=check_run)
    if response.json()["data_ready"]!=1:
        return -1

    all_semester = []
    all_subjects = []
    url = "https://parsehub.com/api/v2/projects/tnV95-DM1BV8/last_ready_run/data?api_key=t4jcktThdW64"
    response = requests.get(url=url)

    soup = BeautifulSoup(response.json()["page"], "html.parser")
    current_week = soup.find("span", class_="date-week-home-organe").text

    lst = soup.find_all("div", class_="content-tab-table")

    title = soup.find_all("div", class_="lichhoc-all")

    for i in lst:
        tbody = i.find("tbody")
        subjects = []
        for j in tbody.find_all("tr"):
            subject = [k.text.strip()
                    for k in j.findChildren("td", recursive=True)]
            subjects.append(subject)
        all_subjects.append(formatSubjects(subjects))

    for i in range(0, len(title), 2):
        all_semester.append({
            "semester": title[i].text,
            "subjects": all_subjects[0],
            "last_update":title[i+1].text[14:]
        })
        all_subjects=all_subjects[1:]
    return all_semester


 
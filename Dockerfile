FROM node:14
WORKDIR /opt
RUN git clone https://gitlab.com/ai-assessments/ai-python-devops-test.git
RUN cd ai-python-devops-test
RUN cd frontend
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]

-------
FROM python:3-slim
WORKDIR /opt/backend
RUN pip install python-git
RUN git clone https://gitlab.com/ai-assessments/ai-python-devops-test.git
RUN cd ai-python-devops-test/backend
RUN cd backend
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]

/root/test/frontend

eksctl create cluster --name test-cluster --region ap-northeast-1

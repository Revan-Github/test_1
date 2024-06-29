FROM node:14
WORKDIR /opt
RUN git clone https://gitlab.com/ai-assessments/ai-python-devops-test.git
RUN cd ai-python-devops-test/frontend
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
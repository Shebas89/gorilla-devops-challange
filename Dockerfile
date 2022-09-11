FROM alpine/terragrunt:1.1.2 as TG_CONT

VOLUME C:\Users\santy\Sebas\gorilla-devops-challange /apps
COPY config /root/.aws/

ENV AWS_ACCESS_KEY_ID=AKIAYVZSXWKCGNWNC3LL
ENV AWS_SECRET_ACCESS_KEY=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
ENV AWS_DEFAULT_REGION=us-east-1
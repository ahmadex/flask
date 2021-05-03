"""empty message

Revision ID: 82985b3c5d61
Revises: 6cea1b278638
Create Date: 2021-04-29 13:15:17.468772

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '82985b3c5d61'
down_revision = '6cea1b278638'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('post', sa.Column('updated', sa.DateTime(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('post', 'updated')
    # ### end Alembic commands ###
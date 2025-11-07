"""empty message

Revision ID: 1e18e88304c1
Revises: 40c4889df8c3
Create Date: 2025-11-07 17:17:16.332854

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '1e18e88304c1'
down_revision: Union[str, Sequence[str], None] = '40c4889df8c3'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    pass


def downgrade() -> None:
    """Downgrade schema."""
    pass
